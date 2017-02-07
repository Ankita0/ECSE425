-- Group 
-- Alina Mambo
-- Ankita Sharma
-- Maana Javadi
-- Nicole Tang

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cache is
generic(
	ram_size : INTEGER := 32768;
);
port(
	clock : in std_logic;
	reset : in std_logic;
	
	-- Avalon interface --
	s_addr : in std_logic_vector (31 downto 0);
	s_read : in std_logic;
	s_readdata : out std_logic_vector (31 downto 0);
	s_write : in std_logic;
	s_writedata : in std_logic_vector (31 downto 0);
	s_waitrequest : out std_logic; 
    
	m_addr : out integer range 0 to ram_size-1;
	m_read : out std_logic;
	m_readdata : in std_logic_vector (7 downto 0);
	m_write : out std_logic;
	m_writedata : out std_logic_vector (7 downto 0);
	m_waitrequest : in std_logic
);
end cache;

architecture arch of cache is

-- declare signals here
constant c_bits_per_word: integer:= 32;
constant c_word_per_block: integer:= 4;
constant c_bits_per_block: integer:= 128;
constant c_total_blocks: integer:= 32;


type cache_state is (IDLE , C_TAG , C_DIRTY_BIT , R_MAIN_MEM , W_MAIN_MEM , W_CACHE);

-- sets up data in a cheche block as an array of 12x8 bit vectors.
type data_array is array(11 downto 0) of STD_LOGIC_VECTOR (7 downto 0);

-- sets cache block as a record with 1 dirty bit, 1 valid bit, 20 tag bits, and 12*8 data bits
type cache_block is record
	dirtyBit: std_logic;
	validBit: std_logic;
	tag: std_logic_vector(19 downto 0);
	data: data_array;
end record;

-- sets entire cache as an array of 32 cache blocks
type chache_mem is array(31 downto 0) of cache_block;

-- declare signals
signal present_state: cache_state;
signal next_state: cache_state;
signal READ_HIT, READ_MISS, WRITE_HIT, WRITE_MISS, DIRTY_BIT, VALID_BIT : STD_LOGIC := '0';


begin

procedure compare_tags is
begin
--TODO


end compare_tags;

procedure check_dirty_bits is
begin
--TODO

end check_dirty_bits;

procedure read_main_mem is
begin
--TODO

end read_main_mem;

procedure write_main_mem is
begin
--TODO

end write_main_mem;


procedure write_to_cache is
begin
--TODO

end write_to_cache;

procedure read_from_cache is
begin
--TODO

end read_from_cache;


cache_state_change: process (clock)
begin
--TODO


end process;

state_action: process (clock)
begin
--TODO


end process;



end arch;